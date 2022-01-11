from myapp.basic_recursions import factorial, factorial_np


def main():
    factorial_5 = factorial(5)
    print(f"Factorial of 5 is {factorial_5} if you do it recursively")
    factorial_5_np = factorial_np(5)
    print(f"If you do it with numpy you get {factorial_5_np}")


if __name__ == '__main__':
    main()
