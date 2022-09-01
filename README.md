# Flutter app upload to pyger and sendDingDingNotification

## install

```
dart pub global activate --source git https://github.com/Invincible1996/build_outputs_script.git
```
```
export PATH="$PATH":"$HOME/.pub-cache/bin"
```

## usage
- upload
```
build_outputs_script uploadToPyger --aKey 'your api_key' --uKey 'your user_key' --desc 'app' --file 'your file path'
```
- sendDingDingNotification
```
build_outputs_script
sendDingDing
--token
'f157daed31fc664fe106ff8fc38a1d7c9bfa72772d5ce93238ecc30c3a965165'
--msg
'##
descrioption
![alt](https://www.pgyer.com/app/qrcodeHistory/150e86904926ca0b3566125f1ce4411055361a2f263456d46098475a38d26bee)'
```
