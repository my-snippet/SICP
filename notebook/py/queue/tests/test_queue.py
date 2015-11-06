import unittest
from py.queue.queue import Queue


class TestQueue(unittest.TestCase):
    def setUp(self):
        self.first_queue = Queue()

    # @unittest.skip("test")
    def test_make_queue(self):
        #pass
        self.assertIsNone(self.first_queue._first)
        self.assertIsNone(self.first_queue._last)
