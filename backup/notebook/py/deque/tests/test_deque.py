import unittest
#from py.deque.deque import Deque

@unittest.skip("showing class skipping")
class TestQueue(unittest.TestCase):
    def setUp(self):
        self.queue = Queue()
        self.item1, self.item2 = 'a', 'b'

    # @unittest.skip("test")
    def test_make_queue(self):
        """
        Initial Queue
        1) First node, second node is initialized to 'None'
        2) Size should be zero. ( isEmpty() == True )
        """
        self.assertIsNone(self.queue._first)
        self.assertIsNone(self.queue._last)
        self.assertTrue(self.queue.isEmpty())

    def test_enqueue_when_empty(self):
        """
        First node should be equal to last node
        """
        self.queue.enqueue(self.item1)
        self.assertEqual(self.queue._first.item, self.item1)
        self.assertEqual(self.queue._first.item, self.queue._last.item)

    def test_enqueue_when_not_empty(self):
        """
        1) Last node should contaions inserted self.item
        2) First node should access next node
        """
        self.queue.enqueue(self.item1)
        self.queue.enqueue(self.item2)
        self.assertEqual(self.queue._size, 2)
        self.assertEqual(self.queue._first.item, self.item1)
        self.assertEqual(self.queue._first.next.item, self.queue._last.item)

    def test_dequeue(self):
        """
        1) If empty, Error should occur
        2) If just 1 item contained, 
            2-1) It should be changed to Empty Queue
            2-2) Head node item should be returned
        3) If more than 2 items contained, 
            the second node should contain head node item
        """
        self.assertRaises(IndexError, self.queue.dequeue)
        
        self.queue.enqueue(self.item1)
        self.queue.enqueue(self.item2)
        self.assertEqual(self.queue.dequeue(), self.item1)
        self.assertEqual(self.queue._first.item, self.item2)

        self.queue.dequeue()
        self.assertIsNone(self.queue._first)
        self.assertIsNone(self.queue._last)

    def test_peek(self):
        """
        1) 'peek' returns first node item.
        2) And it always should do same result
        3) if empty queue, then error occur
        """
        self.assertRaises(IndexError, self.queue.peek)
 
        self.queue.enqueue(self.item1)
        self.assertEqual(self.queue.peek(), self.item1)

        self.assertEqual(self.queue.peek(), self.item1)
