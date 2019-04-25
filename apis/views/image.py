import os
import hashlib
from backend_ch1_sec1 import settings
from django.http import Http404, FileResponse, JsonResponse
from utils.response import CommonResponseMixin
from django.views import View


class ImageListView(View, CommonResponseMixin):
    def get(self, request):
        image_files = os.listdir(settings.IMAGES_DIR)
        response_data = []
        for image_file in image_files:
            response_data.append(
                {
                    "name": image_file,
                    "md5": image_file[:-4]
                }
            )
        response_data = self.wrap_json_response(data=response_data)
        return JsonResponse(data=response_data)


class ImageView(View, CommonResponseMixin):
    def get(self, request):
        md5 = request.GET.get('md5')
        img_file = os.path.join(settings.IMAGES_DIR, md5 + '.jpg')
        if not os.path.exists(img_file):
            return Http404()
        else:

            return FileResponse(open(img_file, 'rb'), content_type='image/jpg')

    def post(self, request):
        files = request.FILES
        print(files)
        response_data = []
        for key, uploaded_file in files.items():
            content = uploaded_file.read()
            md5 = hashlib.md5(content).hexdigest()
            path = os.path.join(settings.IMAGES_DIR, md5 + '.jpg')
            with open(path, 'wb+') as f:
                f.write(content)
            response_data.append({
                'name': md5 + '.jpg',
                'md5': md5
            })
        response = self.wrap_json_response(data=response_data)
        return JsonResponse(data=response, safe=False)

    def delete(self, request):
        md5 = request.GET.get('md5')
        img_name = md5 + '.jpg'
        path = os.path.join(settings.IMAGES_DIR, img_name)
        if os.path.exists(path):
            os.remove(path)
            message = 'remove success'
            code = 200
        else:
            message = 'file(%s) not found' % img_name
            code = 0
        response = self.wrap_json_response(code=code, message=message)
        return JsonResponse(data=response, safe=False)
