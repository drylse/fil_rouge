# Information Orange 3

* <a href="https://github.com/biolab/orange3 target" tagret="_blank">Orange GitHub </a> <br>
* <a href="https://orange3.readthedocs.io/projects/orange-data-mining-library/en/latest/index.html" target="_blank">Orange Documentation</a> <br>


# Installation

## Anaconda

If you are using python provided by Anaconda distribution, you are almost ready to go. Add conda-forge to the list of channels you can install packages from (and make it default)

```bash
conda config --add channels conda-forge
conda config --set channel_priority strict
```

and run

```bash
conda install pyqt
conda install orange3
```

## Pip

Orange can also be installed from the Python Package Index. You may need additional system packages provided by your distribution.

```bash
pip install PyQt5 PyQtWebEngine
pip install orange3
pip3 install Orange3-Associate
```

# Bonus

If you are using Linux you can simply run

```bash
./Orange/run.sh
```