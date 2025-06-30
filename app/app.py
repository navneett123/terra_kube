from flask import Flask, render_template
import os
from datetime import datetime

app = Flask(__name__)


@app.route("/")
def index():
    return render_template("index.html",
                           deployment_name=os.getenv(
                               "DEPLOYMENT_NAME", "myapp"),
                           image_version=os.getenv("IMAGE_VERSION", "latest"),
                           status="Running ✅",
                           timestamp=datetime.now().strftime("%Y-%m-%d %H:%M:%S")
                           )


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
