Class dc.cryptosamples.Samples
{

// Symmetric Keys sample to encrypt

ClassMethod DoAESCBCEncrypt(plaintext As %String) As %Status
{
    // convert to utf-8
    Set text=$ZCONVERT(plaintext,"O","UTF8")
    
    // set a secret key
    Set secretkey = $system.Util.GetEnviron("SECRETKEY")
    Set IV = $system.Util.GetEnviron("SECRETKEY")
    
    // encrypt a text
    Set text = $SYSTEM.Encryption.AESCBCEncrypt(text, secretkey, IV)
    Set ciphertext = $SYSTEM.Encryption.Base64Encode(text)
    
    Write ciphertext
}

// Symmetric Keys sample to decrypt

ClassMethod DoAESCBCDecrypt(ciphertext As %String) As %Status
{
    // set a secret key
    Set secretkey = $system.Util.GetEnviron("SECRETKEY")
    Set IV = $system.Util.GetEnviron("SECRETKEY")
    
    // decrypt a text
    Set text=$SYSTEM.Encryption.Base64Decode(ciphertext)
    Set text=$SYSTEM.Encryption.AESCBCDecrypt(text,secretkey,IV)
    
    Set plaintext=$ZCONVERT(text,"I","UTF8")
    Write plaintext
}

// Asymmetric Keys sample to encrypt

ClassMethod DoRSAEncrypt(plaintext As %String) As %Status
{
    // get public certificate
    Set pubKeyFileName = "/opt/irisbuild/example-com.cert.pem"
    Set objCharFile = ##class(%Stream.FileCharacter).%New()
    Set objCharFile.Filename = pubKeyFileName
    Set pubKey = objCharFile.Read()

    // encrypt using RSA
    Set binarytext = $System.Encryption.RSAEncrypt(plaintext, pubKey)
    Set ciphertext = $SYSTEM.Encryption.Base64Encode(binarytext)
    
    Return ciphertext
}

// Asymmetric Keys sample to decrypt

ClassMethod DoRSADecrypt(ciphertext As %String) As %Status
{
    // get private key
    Set privKeyFileName = "/opt/irisbuild/example-com.key.pem"
    Set privobjCharFile = ##class(%Stream.FileCharacter).%New()
    Set privobjCharFile.Filename = privKeyFileName
    Set privKey = privobjCharFile.Read()

    // get ciphertext in binary format
    Set text=$SYSTEM.Encryption.Base64Decode(ciphertext)

    // decrypt text using RSA
    Set plaintext = $System.Encryption.RSADecrypt(text, privKey)

    Return plaintext
}

// Hash sample 

ClassMethod DoHash(plaintext As %String) As %Status
{
    // convert to utf-8
    Set text=$ZCONVERT(plaintext,"O","UTF8")
    
    // hash a text
    Set hashtext = $SYSTEM.Encryption.MD5Hash(text)
    
    Write $SYSTEM.Encryption.Base64Encode(hashtext)
}

}
