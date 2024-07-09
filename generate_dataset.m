%% Clear the workspace
clear all
close all
clc


%% Reproducibility
Seed = 0;
rng(Seed);


%% Parameters
DatasetDir = "./TOSCA-dataset";
OutputDir  = "./BadTOSCA-dataset";
MaxDeform = 0.9;


%% Create output dataset
InputShapes = strcat(DatasetDir, "/offs");
OutputShapes = strcat(OutputDir, "/offs");
OutputRegs = strcat(OutputDir, "/regs");
if ~exist(OutputDir, 'dir')
    mkdir(OutputDir);
end
if ~exist(OutputShapes, 'dir')
    mkdir(OutputShapes);
end


%% Ruin TOSCA
Data = dir(InputShapes);
for i = 1:length(Data)
    Name = Data(i).name;
    if startsWith(Name, '.')
        continue;
    end
    if ~endsWith(Name, '.off')
        continue;
    end
    Path = strcat(InputShapes, '/', Name);

    M = load_off(Path);
    V = M.VERT;
    N = M;
    [M.VERT, Pi] = ruin_connectivity(M, MaxDeform);
    [M.X, M.Y, M.Z] = deal(M.VERT(:, 1), M.VERT(:, 2), M.VERT(:, 3));

    Path = strcat(OutputShapes, '/', Name);
    write_off(M, Path);
    Name = replace(Name, ".off", "-reg.mat");
    Path = strcat(OutputRegs, '/', Name);
    save(Path, "Pi", "V");
    
    disp(Path);
end


















































