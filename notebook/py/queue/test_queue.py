import unittest
#from queue import Queue


class Queue(object):
    """An implementation of a simple queue with linked list."""

    def __init__(self):
        """Initialize an empty queue."""
        self._first = None
        self._last = None
        self._size = 0

    def isEmpty(self):
        """Check if the queue is empty.

        Returns:
            True if the queue is empty.
            False otherwise.
        """
        return self._size == 0


class TestQueue(unittest.TestCase):

    def setUp(self):
        self.first_queue = Queue()

    # @unittest.skip("test")
    def test_make_queue(self):
        #pass
        # print(type(self.first_queue))
        self.assertTrue(self.first_queue.isEmpty())
        self.assertIsNone(self.first_queue._last)
