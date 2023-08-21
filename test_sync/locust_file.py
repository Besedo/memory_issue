import base64
import random
import os

from locust import between, task
from locust.contrib.fasthttp import FastHttpUser

class APIUser(FastHttpUser):
    host = f"http://{os.environ.get('API_HOST', '0.0.0.0')}:{os.environ.get('API_PORT', '8085')}"
    wait_time = between(0, 1)
    NUM_IMGS = int(os.environ.get('NUM_IMGS', 120))
    ENDPOINT = os.environ.get('ENDPOINT', "/infer")

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.img_data = self._get_img_base64()
        self.all_data = [{"id": str(i), "data": self.img_data} for i in range(self.NUM_IMGS)]

    @staticmethod
    def _get_img_base64():
        with open("test.jpg", "rb") as file:
            return base64.b64encode(file.read()).decode("utf-8")

    def _random_data(self):
        nb_images = random.randint(1, self.NUM_IMGS)
        return self.all_data[:nb_images]

    @task
    def predict(self):
        self.client.post(ENDPOINT, json=self._random_data())