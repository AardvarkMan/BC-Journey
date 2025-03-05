var __ViewerFrame;
var __ViewerOrigin;

function InitializeControl(url) { 
    alert('InitializeControl');

    var Body = '';
    //__ViewerOrigin = getViewOrigin(url);
    alert('InitializeControl end');
    //window.addEventListener("message", onMessage, false);
    var controlAddIn = document.getElementById('controlAddIn');
    alert('controlAddIn: ' + controlAddIn);
    //Body += ('TEST');
    //controlAddIn.innerHTML = '<iframe id="viewer" style="border-style: none; margin: 0px; padding: 0px; height: 100%; width: 100%" allowFullScreen></iframe>'
    Body += "<!DOCTYPE html>";
    Body += "<html lang='en'>";
    Body += "<head>";
    Body += "    <meta charset='UTF-8'>";
    Body += "    <meta name='viewport' content='width=device-width, initial-scale=1.0'>";
    Body += "    <title>Webcam Capture</title>";
    Body += "    <style>";
    Body += "        #video {";
    Body += "            width: 320px;";
    Body += "            height: 240px;";
    Body += "            border: 1px solid black;";
    Body += "        }";
    Body += "        #canvas {";
    Body += "            display: none;";
    Body += "        }";
    Body += "    </style>";
    Body += "</head>";
    Body += "<body>";
    Body += "    <h1>Capture Image from Webcam</h1>";
    Body += "    <video id='video' autoplay></video>";
    Body += "    <button id='capture'>Capture</button>";
    Body += "    <canvas id='canvas'></canvas>";
    Body += "    <img id='photo' alt='Captured Image'>";
    Body += "    <script>";
    Body += "        const video = document.getElementById('video');";
    Body += "        const canvas = document.getElementById('canvas');";
    Body += "        const photo = document.getElementById('photo');";
    Body += "        const captureButton = document.getElementById('capture');";
    Body += "        navigator.mediaDevices.getUserMedia({ video: true })";
    Body += "            .then(stream => {";
    Body += "                video.srcObject = stream;";
    Body += "            })";
    Body += "            .catch(err => {";
    Body += "                console.error('Error accessing webcam: ', err);";
    Body += "            })";
    Body += "        captureButton.addEventListener('click', () => {";
    Body += "            const context = canvas.getContext('2d');";
    Body += "            canvas.width = video.videoWidth;";
    Body += "            canvas.height = video.videoHeight;";
    Body += "            context.drawImage(video, 0, 0, canvas.width, canvas.height);";
    Body += "            const dataURL = canvas.toDataURL('image/png');";
    Body += "            photo.src = dataURL;";
    Body += "        })";
    Body += "    </script>";
    Body += "</body>";
    Body += "</html>";
    controlAddIn.innerHTML = Body;
}

