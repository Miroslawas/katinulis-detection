import pandas as pd
from glob import glob
import os

data_path = os.environ['KATINULIS_DETECTION_DATA_PATH']
data_path = '/Users/lstasys/development/datasets/katinulis-detection'


if __name__ == '__main__':

    f_paths = glob(data_path + '/katinulis-photos/*')
    f_path_df = pd.DataFrame(data=f_paths, columns=['f_path'])
    f_path_df['f_name'] = f_path_df['f_path'].str.split('/').apply(lambda x: x[-1])
    f_path_df['label'] = 'katinulis'

    f_path_df.to_csv(data_path + '/photos_meta.csv', index=False)
