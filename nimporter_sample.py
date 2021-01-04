import nimporter
from nimutils import calc , thread_test, uuid

# call nim method
print(calc.add(2, 4))  # 6

# call nimble installed library.
print(uuid.generate())

# multi thread test
thread_test.threadTest()