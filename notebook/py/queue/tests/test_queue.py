import unittest
from py.queue.queue import Queue


class TestQueue(unittest.TestCase):
    def setUp(self):
        self.first_queue = Queue()

    # @unittest.skip("test")
    def test_make_queue(self):
        """
        Initial Queue
        1) First node, second node is initialized to 'None'
        2) Size should be zero. ( isEmpty() == True )
        """
        self.assertIsNone(self.first_queue._first)
        self.assertIsNone(self.first_queue._last)
        self.assertTrue(self.first_queue.isEmpty())

    def test_insert_queue(self):
        """
        1. Empty
            1) First node should be equal to second node
        2. Not empty
            1) Last node should contaions inserted item
            2) First node should access next node
        """
        # pass
