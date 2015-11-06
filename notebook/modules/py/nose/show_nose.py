import subprocess


def show_all_tests():
    out, err = subprocess.Popen(
            ['nosetests'],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
            ).communicate()
    print(err.decode("utf-8"))


def show_test(module_path):
    """
    module_path could be a file name
    """
    out, err = subprocess.Popen(
            ['nosetests', module_path],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE
            ).communicate()
    print(err.decode("utf-8"))
