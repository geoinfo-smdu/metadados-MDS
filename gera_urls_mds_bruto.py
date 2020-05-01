import os

f= open("urls_mds_bruto.txt","w+")

for i in os.listdir('MDS'):
    url = f"http://geosampa.prefeitura.sp.gov.br/PaginasPublicas/downloadIfr.aspx?orig=DownloadMDSLAZ&arq=MDS_2017%5C{i}.laz&arqTipo=LAZ\r\n"
    f.write(url)

f.close
