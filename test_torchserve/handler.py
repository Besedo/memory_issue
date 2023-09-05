from ts.torch_handler.base_handler import BaseHandler


class ModelHandler(BaseHandler):
    """
    A custom model handler implementation.
    """

    def __init__(self):
        self._context = None
        self.initialized = False
        self.explain = False
        self.target = 0

    def initialize(self, context):
        self._context = context
        self.initialized = True
        print("initialize: to load model")

    def preprocess(self, data):
        images = []

        for row in data:
            # Compat layer: normally the envelope should just return the data
            # directly, but older versions of Torchserve didn't have envelope.
            image = row.get("data") or row.get("body")
            images.append(image)
        print(f"preprocessed: {len(images)} imgs")

        return images

    
    def handle(self, data, context):
        """
        Invoke by TorchServe for prediction request.
        Do pre-processing of data, prediction using model and postprocessing of prediciton output
        """
        images = self.preprocess(data)
        return [{"data": len(images)} for _ in range(len(images))]
