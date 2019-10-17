def binarizar(decimal):
    binario = ''
    i=0
    #while decimal // 2 != 0:
    while i<7:
        decimal // 2 #
        binario = str(decimal % 2) + binario
        decimal = decimal // 2
        i=i+1
    return str(decimal) + binario

#http://elclubdelautodidacta.es/wp/2013/01/python-un-programa-para-la-conversion-de-decimal-a-binario/
