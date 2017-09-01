#!/usr/bin/env python
# -*- coding: utf-8 -*-

import getpass
from Crypto.Cipher import AES
import base64
import os
import sys

def main():

    if 3 > len(sys.argv):
        print "Input error!"
        return None

    flist = sys.argv[2:]

    if '-e' == sys.argv[1]:
        pw = get_passwd(True)
        for fname in flist:
            encrypt_a_file(fname, pw)
    elif '-d' == sys.argv[1]:
        pw = get_passwd(False)
        for fname in flist:
            decrypt_a_file(fname, pw)
    else:
        print "Input error!"

def encrypt_a_file(fname, pw):
    
    context = get_context(fname)
    if not context:
        return None

    str_enc_aes = encryption(context, pw)

    write_context(fname+".enc", str_enc_aes)
    
    print fname+" has been encrypted!"

def decrypt_a_file(fname, pw):

    str_enc_aes = get_context(fname+".enc")
    if not str_enc_aes:
        return None

    context_dec = decryption(str_enc_aes, pw)

    if context_dec:
        write_context(fname+".dec", context_dec)
        print fname+" has been decrypted!"
    else:
        print fname+" has NOT been decrypted!"
    
def get_passwd(b_set):
    
    passwd = getpass.getpass("Please enter a password: \n")
    if b_set:
        passwd_v = getpass.getpass("Please validate the password: \n")
        if len(passwd) < 6:
            print "The password should be more than 6 characters."
            return None
        if passwd != passwd_v:
            print "Password confirmed error!"
            return None

    return passwd
    
def get_context(fname):
    
    try:
        fid = open(fname, 'r')
    except IOError:
        print 'Cannot open', fname
    else:
        context = fid.read()
        fid.close()

        return context

def write_context(fname, context):
    
    fid = open(fname, 'w')
    fid.write(context)
    fid.close()

def encryption(privateInfo, pw):

	BLOCK_SIZE = 16
	PADDING = '{'
	pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * PADDING
	EncodeAES = lambda c, s: base64.b64encode(c.encrypt(pad(s)))
	cipher = AES.new(pad(pw))
	encoded = EncodeAES(cipher, privateInfo)
        
        return encoded

def decryption(encryptedString, pw):

	BLOCK_SIZE = 16
	PADDING = '{'
	pad = lambda s: s + (BLOCK_SIZE - len(s) % BLOCK_SIZE) * PADDING
	DecodeAES = lambda c, e: c.decrypt(base64.b64decode(e)).rstrip(PADDING)
	cipher = AES.new(pad(pw))
	decoded = DecodeAES(cipher, encryptedString)

        return decoded

    
if __name__ == '__main__':
    main()
