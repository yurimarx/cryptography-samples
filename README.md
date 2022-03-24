[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg?style=flat&logo=AdGuard)](LICENSE)
# cryptography-samples
Examples of %SYSTEM.Encryption class methods 

## Installation
1. Clone/git pull the repo into any local directory

```
$ git clone https://github.com/yurimarx/cryptography-samples.git
```

2. Open a Docker terminal in this directory and run:

```
$ docker-compose build
```

3. Run the IRIS container:

```
$ docker-compose up -d 
```

4. Open IRIS Terminal:
```
$ docker-compose exec iris iris session iris -U IRISAPP
IRISAPP>
```
5. To do RSAEncrypt - for asymmetric encrypt:
```
IRISAPP>Set ciphertext = ##class(dc.cryptosamples.Samples).DoRSAEncrypt("InterSystems")
IRISAPP>Write ciphertext
Ms/eR7pPmE39KBJu75EOYIxpFEd7qqoji61EfahJE1r9mGZX1NYuw5i2cPS5YwE3Aw6vPAeiEKXF
rYW++WtzMeRIRdCMbLG9PrCHD3iQHfZobBnuzx/JMXVc6a4TssbY9gk7qJ5BmlqRTU8zNJiiVmd8
pCFpJgwKzKkNrIgaQn48EgnwblmVkxSFnF2jwXpBt/naNudBguFUBthef2wfULl4uY00aZzHHNxA
bi15mzTdlSJu1vRtCQaEahng9ug7BZ6dyWCHOv74O/L5NEHI+jU+kHQeF2DJneE2yWNESzqhSECa
ZbRjjxNxiRn/HVAKyZdAjkGQVKUkyG8vjnc3Jw==
```
6. To do RSADecrypt - for asymmetric decrypt:
```
IRISAPP>Set plaintext = ##class(dc.cryptosamples.Samples).DoRSADecrypt(ciphertext)
IRISAPP>Write plaintext
InterSystems
```
7. To do AESCBCEncrypt - for symmetric encrypt:
```
IRISAPP>Do ##class(dc.cryptosamples.Samples).DoAESCBCEncrypt("InterSystems")
8sGVUikDZaJF+Z9UljFVAA==
```
8. To do AESCBCDecrypt - for symmetric decrypt:
```
IRISAPP>Do ##class(dc.cryptosamples.Samples).DoAESCBCDecrypt("8sGVUikDZaJF+Z9UljFVAA==")
InterSystems
```
9. To do DoHash - for hash text:
```
IRISAPP>Do ##class(dc.cryptosamples.Samples).DoHash("InterSystems")
rOs6HXfrnbEY5+JBdUJ8hw==
```
10. To exit the terminal, do any of the following:
```
Enter HALT or H (not case-sensitive)
```

# Credits
1. https://community.intersystems.com/post/format-public-key-when-using-rsaencrypt-method-systemencryption-or-systemencryptionrsaencrypt

2. https://openexchange.intersystems.com/package/intersystems-iris-dev-template

3. https://stackoverflow.com/questions/26029597/openssl-x509-certificate-with-own-rsa-public-key-information

