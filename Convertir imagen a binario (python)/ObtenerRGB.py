import os
from PIL import Image
import converbin


photo = Image.open('pruebaimagg.png') #Nombre de la iagen
photo = photo.convert('RGB')

width = photo.size[0] #Se define W y H de la imagen
height = photo.size[1]

archivoR = open("pixelR.txt", 'w')
archivoG = open("pixelG.txt", 'w')
archivoB = open("pixelB.txt", 'w')
##archivoR = open("pixelR.bin", 'w')
##archivoG = open("pixelG.bin", 'w')
##archivoB = open("pixelB.bin", 'w')
##archivoB = open("pixelB.mem", 'w')

for y in range(0, height): #cada pixel con sus coordenadas
    row = ""
    print("print y: ",y)
    for x in range(0, width):
        RGB = photo.getpixel((x,y))
        R,G,B = RGB  #los valores RGB ya se pueden utilizar
        print("************")
        print(R)
        archivoR.write(str(converbin.binarizar(R)) + os.linesep)
        ##archivoR.write(converbin.binarizar(R) + os.linesep)
        print(G)
        archivoG.write(str(converbin.binarizar(G)) + os.linesep)
        ##archivoG.write(converbin.binarizar(G) + os.linesep)
        print(B)
        archivoB.write(str(converbin.binarizar(B)) + os.linesep)
        ##archivoB.write(converbin.binarizar(B) + os.linesep)

archivoR.close()
archivoG.close()
archivoB.close()

