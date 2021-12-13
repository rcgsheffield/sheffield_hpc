#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=8000
#SBATCH --job-name=name_OpenFOAM_smp_4
#SBATCH --output=output_OpenFOAM_smp_4
#SBATCH --time=01:00:00
#SBATCH --mail-user=a.person@sheffield.ac.uk
#SBATCH --mail-type=ALL

rm -r /fastdata/$USER/tests/openfoam/run/

mkdir -p /fastdata/$USER/tests/openfoam/run

cd /fastdata/$USER/tests/openfoam/run

module load OpenFOAM/8-foss-2020a

source $FOAM_BASH

cp -r $FOAM_TUTORIALS/incompressible/simpleFoam/pitzDaily .

chmod 700 -R pitzDaily && cd pitzDaily


cat <<EOF > system/decomposeParDict
/*---------------------------------------------------------------------------*\
| =========                 |                                                 |
| \\      /  F ield         | OpenFOAM: The Open Source CFD Toolbox           |
|  \\    /   O peration     | Version:  1.3                                   |
|   \\  /    A nd           | Web:      http://www.openfoam.org               |
|    \\/     M anipulation  |                                                 |
\*---------------------------------------------------------------------------*/

FoamFile
{
    version         2.0;
    format          ascii;

    root            "";
    case            "";
    instance        "";
    local           "";

    class           dictionary;
    object          decomposeParDict;
}

// * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * //


numberOfSubdomains 4;

method          simple;

simpleCoeffs
{
    n               (1 4 1);
    delta           0.001;
}

hierarchicalCoeffs
{
    n               (1 1 1);
    delta           0.001;
    order           xyz;
}

metisCoeffs
{
    processorWeights
    (
        1
        1
        1
    );
}

manualCoeffs
{
    dataFile        "";
}

distributed     no;

roots
(
);


// ************************************************************************* //
EOF


srun --export=ALL blockMesh
srun --export=ALL decomposePar
srun --export=ALL simpleFoam -parallel
