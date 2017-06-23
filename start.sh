#!/bin/bash
source activate iraf27
jupyter notebook --allow-root --no-browser --NotebookApp.iopub_data_rate_limit=100000000
