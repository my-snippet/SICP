import unittest
from py.queue.queue import Queue


class TestQueue(unittest.TestCase):
    def setUp(self):
        self.first_queue = Queue()

    # @unittest.skip("test")
    def test_make_queue(self):
        """
        Initial Queue
        1. first node, second node is initialized to 'None'
        2. size should be zero. ( isEmpty() == True )
        """
        self.assertIsNone(self.first_queue._first)
        self.assertIsNone(self.first_queue._last)
        self.assertTrue(self.first_queue.isEmpty())

#    def test_
