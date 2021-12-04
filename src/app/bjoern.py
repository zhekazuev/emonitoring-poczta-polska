from app import app
import os
import bjoern

if __name__ == "__main__":
    """WSGI based on bjoern with metrics.
    See https://github.com/jonashaag/bjoern - bjoern.
    and
    See https://github.com/jonashaag/bjoern/blob/master/instrumentation.md - metrics.
    """
    # ----Remainder of Code----
    port = int(os.environ.get('PORT', 5000))
    bjoern.listen(app, host="0.0.0.0", port=port)
    bjoern.run()
