from myapp.basic_recursions import factorial, factorial_np


class TestMaths:
    def test_factorial(self):
        assert factorial(5) == 120

    def test_factorial_np(self):
        assert factorial_np(5) == 120
