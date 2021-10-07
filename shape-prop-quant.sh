MODEL_PATH="/home/ivankobzarev/nnc/quantization/segm.ptl"
python -c "import torch; from torch import nn; m = torch.jit.load('$MODEL_PATH').eval(); inputs = list(m.graph.inputs()); size = [1, 3, 224, 224]; inputs[1].setType(inputs[1].type().with_sizes(size));torch._C._jit_pass_propagate_shapes_on_graph(m.graph);torch._C._jit_pass_peephole(m.graph);torch._C._jit_pass_constant_propagation(m.graph);print(m.graph);"
