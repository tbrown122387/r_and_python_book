import pandas as pd
import numpy as np

chapter_names = ["01-intro.Rmd","02-basic_types.Rmd","03-vectors_and_arrays.Rmd","04-arrays_and_matrices.Rmd","05-lists_and_dictionaries.Rmd"
,"06-functions.Rmd","07-categorical_data.Rmd","08-data_frames.Rmd","09-io.Rmd"]


x = pd.read_csv(chapter_names[0])
