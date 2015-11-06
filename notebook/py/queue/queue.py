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
