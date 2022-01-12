import numpy as np


def factorial(n: int) -> int:
    if n < 0:
        raise RuntimeError("negative integer input to factorial")
    elif n in [0, 1]:
        return 1
    else:
        return n * factorial(n - 1)


def factorial_np(n: int) -> int:
    if n < 0:
        raise RuntimeError("Not gonna give you that. Sorry")
    return np.multiply.reduce(1 + np.arange(5))


def longline_true() -> None:
    """This line is intentionally pretty long in order to demonstrate we are respecting pylama.ini"""
    return True
