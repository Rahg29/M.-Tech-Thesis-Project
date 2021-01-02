# M.-Tech-Thesis-Project
Energy Efficient Design for Accelerate Sparsh Convolutional Neural Network


## Python projects

There are 3 Python packages and 7 Python code files are used to accomplish the needs of the dissertation work.
Necessary software packages need to install to run the above mentioned packages & codes on Windows (64-bit) environment:
1. Python IDLE 3.6 (64-bit) or the latest version
2. Numpy library
3. Pandas library
4. Matplotlib library
5. Argparse library
6. Tqdm library
Description of Python packages:
1. Full_precision_weights: It consists of Python code files in which 5 layer LeNet architecture is implemented with full precision weights. Full precision weights are stored in ‘params.pkl’ file to test the accuracy of the model.
2. Ternary_weights_ECF: It consists of Python code files in which 5 layer LeNet architecture is implemented with Ternary weights via ECF. These Ternary weights are stored in ‘ECF_params.pkl’ file to test the accuracy of the model.
3. Ternary_weights_QCF: It consists of Python code files in which 5 layer LeNet architecture is implemented with Ternary weights via QCF. These Ternary weights are stored in ‘QCF_params.pkl’ file to test the accuracy of the model.
Steps to execute these packages:
1. Open the command prompt.
2. Change the current directory to the directory where ‘train_cnn.py’ file is present in the given package.
3. Use ‘C:\................\ train_cnn.py '< file_name >.pkl' command to train the CNN model and save parameters for testing.
4. Use ‘C:\................\ measure_performance.py '< file_name >.pkl' command to test the CNN model with the help of saved parameters.
5. Accuracy, plot and bar graph are obtained after testing of CNN model.
Description of Python code files:
1. Activation_FC_Layer_AIM: It consists of Python code of the fully-connected layer via AIM algorithm.
2. Activation_FC_Layer_DIM: It consists of Python code of the fully-connected layer via DIM algorithm.
3. Activation_FC_Layer_CM: It consists of Python code of the fully-connected layer via conventional method.
4. Output_Neuron_AIM: It consists of Python code of AIM algorithm which gives one neuron as an output.
5. Output_Neuron_DIM: It consists of Python code of DIM algorithm which gives one neuron as an output.
6. Output_Neuron_CM: It consists of Python code of conventional method which gives one neuron as an output.
7. Sparse_calculation: It consists of Python code which calculates the sparsity present in the Ternary weights.
Steps to execute these files:
1. Open Python IDLE.
2. Open the desired code file in IDLE.
3. Click on ‘Run -> Run module’ command in the menu bar or Press ‘F5’ command to run the code.

# Verilog projects

Seven Verilog projects that are accomplished to fulfil the needs of the dissertation work are as follows:
Tool required: Vivado 2018.1 or the latest version
1. AIM_algorithm: It consists of Verilog code of AIM algorithm in which activations & weights are chosen of (20, 1) dimension. It contains one design source and one simulation source. It can run on default settings in any latest version of Vivado tool.
2. DIM_algorithm: It consists of Verilog code of DIM algorithm in which activations & weights are chosen of (20, 1) dimension. It contains one design source and one simulation source. It can run on default settings in any latest version of Vivado tool.
3. CM_algorithm: It consists of Verilog code of conventional method in which activations & weights are chosen of (20, 1) dimension. It contains one design source and one simulation source. It can run on default settings in any latest version Vivado tool.
4. FC_by_AIM: It consists of Verilog code of fully-connected layer via AIM algorithm in which activations are of (128, 1) dimension. It contains three design sources and one simulation source. Memory initialization file (MIF) such as ‘AIM_act.mif’ and ‘AIM_weight.mif’ should be added to the design source so that they are available to both the code and the test bench. To run this code on Vivado tool, select ‘FC_by_AIM.v’ file as a top module in general settings and ‘FC_by_AIM_tb.v' file as a top module in simulation settings.
5. FC_by_DIM: It consists of Verilog code of fully-connected layer via DIM algorithm in which activations are of (128, 1) dimension. It contains three design sources and one simulation source. Memory initialization file (MIF) such as ‘DIM_act.mif’ and ‘DIM_weight.mif’ should be added to the design source so that they are available to both the code and the test bench. To run this code on Vivado tool, select ‘FC_by_DIM.v' file as a top module in general settings and ‘FC_by_DIM_tb.v' file as a top module in simulation settings.
6. CNN_Comparator_Parallel: It consists of Verilog code of convolutional layer of (5, 5) dimension which exploits parallelism without multiplications. It contains one design source and one simulation source. Memory initialization file (MIF) such as ‘A0’, ‘A1’,
A2, ‘A3’, ‘A4’, ‘AIM_act.mif’ and ‘AIM_weight.mif’ should be added to the design source so that they are available to both the code and the test bench. It can run on default settings in any latest version Vivado tool.
7. CNN_MUL_Parallel: It consists of Verilog code of convolutional layer of (5, 5) dimension which exploits parallelism with multiplications. It contains one design source and one simulation source. Memory initialization file (MIF) such as ‘A0’, ‘A1’, A2, ‘A3’, ‘A4’, ‘AIM_act.mif’ and ‘AIM_weight.mif’ should be added to the design source so that they are available to both the code and the test bench. It can run on default settings in any latest version Vivado tool.
Steps to execute Verilog projects:
1. Open Vivado tool.
2. Select Kintex-7 xc7k70tfbg484-1 FPGA device by clicking on ‘Settings -> Project device’ command.
3. Check general settings and simulation settings.
4. Upload MIF file if present in the code by adding it through the design source.
5. Click on ‘Run Simulation -> Run behavioural Simulation’ to run simulation for a given project.
6. Click on ‘Run Synthesis’ to run synthesis for a given project.
7. Click on ‘Run Implementation’ to run implementation for a given project.
