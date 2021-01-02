# M.Tech-Thesis-Project
Energy Efficient Design for Accelerate Sparsh Convolutional Neural Network

## Abstract

The state-of-the art deep learning architecture, Convolutional Neural Network (CNN), widely
used in the applications such as speech recognition, face detection, natural language processing &
computer vision. MAC units which is an integral part of CNN require large computations and
memory resources. They result in more power dissipation for a low power embedded device such
as IOT. Hence, the hardware implementation of CNN to produce high throughput is one of the
challenges nowadays. There are number of techniques which are being developed to counter this
problem. Among these, Sparsity is widely accepted to resolve this issue by zeroing a large portion
of both weights and activations. Eventually sparsity results in fewer MAC operations with a little
loss in accuracy.

Ternary weights which are restrained to only three possible values (e.g. -1 or 0 or 1), can bring
immense benefits to CNN architecture by replacing MAC operations with simple accumulations.
It eliminates multipliers which are power hungry and space taking components in neural networks.
Therefore, Ternary weights generated by a proposed non-linear method introduce sparsity with
little compromise in accuracy. Experiment results also show the enhancement of 52% sparsity with
a 4% loss in accuracy.

However, there is a need of proper alignment of Weights and Activations to get the benefit
of Sparsity. In this direction an existing work proposed Dual Indexing Module (DIM) to efficiently
handle the alignment issue. But, the DIM technique requires MAC units & multiplexers which may
not be used in computation. Therefore, an Activation Indexing Module (AIM) is proposed which
makes CNN computation and energy efficient in fully-connected layer using Ternary weights. Also,
Cadence RTL compiler results show that the proposed indexing module saves 1.3 nj of energy as
compared to existing method. In addition, on FPGA CNN architecture gets the benefit of Intra
kernel & Inter Output parallelism in convolution-layer which speed up the computation process.
So exploiting these parallelism along with mutliplier-less operations makes convolution-layer easily
deployable on FPGA.


## Python Implementation

There are 3 Python packages and 7 Python code files are used to accomplish the needs of the dissertation work.
Necessary software packages need to install to run the above mentioned packages & codes on Windows (64-bit) environment:

1. __Python IDLE 3.6 (64-bit) or the latest version__
2. __Numpy library__
3. __Pandas library__
4. __Matplotlib library__
5. __Argparse library__
6. __Tqdm library__

Description of Python packages:

1. __Full_precision_weights:__ It consists of Python code files in which 5 layer LeNet architecture is implemented with full precision weights. Full precision weights are stored in `params.pkl` file to test the accuracy of the model.
2. __Ternary_weights_ECF:__ It consists of Python code files in which 5 layer LeNet architecture is implemented with Ternary weights via ECF. These Ternary weights are stored in `ECF_params.pkl` file to test the accuracy of the model.
3. __Ternary_weights_QCF:__ It consists of Python code files in which 5 layer LeNet architecture is implemented with Ternary weights via QCF. These Ternary weights are stored in `QCF_params.pkl` file to test the accuracy of the model.

Steps to execute these packages:

1. Open the command prompt.
2. Change the current directory to the directory where `train_cnn.py` file is present in the given package.
3. Use `C:\................\ train_cnn.py < file_name >.pkl` command to train the CNN model and save parameters for testing.
4. Use `C:\................\ measure_performance.py < file_name >.pkl` command to test the CNN model with the help of saved parameters.
5. Accuracy, plot and bar graph are obtained after testing of CNN model.

Description of Python code files:

1. __Activation_FC_Layer_AIM:__ It consists of Python code of the fully-connected layer via AIM algorithm.
2. __Activation_FC_Layer_DIM:__ It consists of Python code of the fully-connected layer via DIM algorithm.
3. __Activation_FC_Layer_CM:__ It consists of Python code of the fully-connected layer via conventional method.
4. __Output_Neuron_AIM:__ It consists of Python code of AIM algorithm which gives one neuron as an output.
5. __Output_Neuron_DIM:__ It consists of Python code of DIM algorithm which gives one neuron as an output.
6. __Output_Neuron_CM:__ It consists of Python code of conventional method which gives one neuron as an output.
7. __Sparse_calculation:__ It consists of Python code which calculates the sparsity present in the Ternary weights.

Steps to execute these files:
1. Open Python IDLE.
2. Open the desired code file in IDLE.
3. Click on ‘Run -> Run module’ command in the menu bar or Press ‘F5’ command to run the code.

## Verilog Implementation

Seven Verilog projects that are accomplished to fulfil the needs of the dissertation work are as follows:

Tool required: Vivado 2018.1 or the latest version

1. __AIM_algorithm:__ It consists of Verilog code of AIM algorithm in which activations & weights are chosen of (20, 1) dimension. It contains one design source and one simulation source. It can run on default settings in any latest version of Vivado tool.
2. __DIM_algorithm:__ It consists of Verilog code of DIM algorithm in which activations & weights are chosen of (20, 1) dimension. It contains one design source and one simulation source. It can run on default settings in any latest version of Vivado tool.
3. __CM_algorithm:__ It consists of Verilog code of conventional method in which activations & weights are chosen of (20, 1) dimension. It contains one design source and one simulation source. It can run on default settings in any latest version Vivado tool.
4. __FC_by_AIM:__ It consists of Verilog code of fully-connected layer via AIM algorithm in which activations are of (128, 1) dimension. It contains three design sources and one simulation source. Memory initialization file (MIF) such as `AIM_act.mif` and `AIM_weight.mif` should be added to the design source so that they are available to both the code and the test bench. To run this code on Vivado tool, select `FC_by_AIM.v` file as a top module in general settings and `FC_by_AIM_tb.v` file as a top module in simulation settings.
5. __FC_by_DIM:__ It consists of Verilog code of fully-connected layer via DIM algorithm in which activations are of (128, 1) dimension. It contains three design sources and one simulation source. Memory initialization file (MIF) such as `DIM_act.mif` and `DIM_weight.mif` should be added to the design source so that they are available to both the code and the test bench. To run this code on Vivado tool, select `FC_by_DIM.v` file as a top module in general settings and `FC_by_DIM_tb.v` file as a top module in simulation settings.
6. __CNN_Comparator_Parallel:__ It consists of Verilog code of convolutional layer of (5, 5) dimension which exploits parallelism without multiplications. It contains one design source and one simulation source. Memory initialization file (MIF) such as `A0`, `A1`,
`A2`, `A3`, `A4`, `AIM_act.mif` and `AIM_weight.mif` should be added to the design source so that they are available to both the code and the test bench. It can run on default settings in any latest version Vivado tool.
7. __CNN_MUL_Parallel:__ It consists of Verilog code of convolutional layer of (5, 5) dimension which exploits parallelism with multiplications. It contains one design source and one simulation source. Memory initialization file (MIF) such as `A0`, `A1`, `A2`, `A3`, `A4`, `AIM_act.mif` and `AIM_weight.mif` should be added to the design source so that they are available to both the code and the test bench. It can run on default settings in any latest version Vivado tool.

Steps to execute Verilog projects:

1. Open Vivado tool.
2. Select Kintex-7 xc7k70tfbg484-1 FPGA device by clicking on `Settings -> Project device` command.
3. Check general settings and simulation settings.
4. Upload MIF file if present in the code by adding it through the design source.
5. Click on `Run Simulation -> Run behavioural Simulation` to run simulation for a given project.
6. Click on `Run Synthesis` to run synthesis for a given project.
7. Click on `Run Implementation` to run implementation for a given project.
