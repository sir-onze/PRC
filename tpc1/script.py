import csv

with open('saladeaulainf.ttl', 'a') as new:
    with open('alunos.csv', mode='r') as infile:
      reader = csv.reader(infile)
      header = next(reader)
      for rows in reader:
        new.write("<http://www.semanticweb.org/macz/ontologies/2020/salaAula#"+rows[0]+">"+" rdf:type owl:NamedIndividual ,"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#Aluno> ,"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#Pessoa> ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#frequenta> <http://www.semanticweb.org/macz/ontologies/2020/salaAula#prc> ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#ident>"+"\" "+rows[0]+"\""+"^^xsd:string ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#nome>"+"\" "+rows[1]+"\""+"^^xsd:string .")
        new.write("<http://www.semanticweb.org/macz/ontologies/2020/salaAula#"+rows[0]+">"+" rdf:type owl:NamedIndividual ,"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#Aluno> ,"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#Pessoa> ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#frequenta> <http://www.semanticweb.org/macz/ontologies/2020/salaAula#gcs> ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#ident>"+"\" "+rows[0]+"\""+"^^xsd:string ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#nome>"+"\" "+rows[1]+"\""+"^^xsd:string .")
        new.write("<http://www.semanticweb.org/macz/ontologies/2020/salaAula#"+rows[0]+">"+" rdf:type owl:NamedIndividual ,"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#Aluno> ,"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#Pessoa> ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#frequenta> <http://www.semanticweb.org/macz/ontologies/2020/salaAula#ipln> ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#ident>"+"\" "+rows[0]+"\""+"^^xsd:string ;"+"\n"+"<http://www.semanticweb.org/macz/ontologies/2020/salaAula#nome>"+"\" "+rows[1]+"\""+"^^xsd:string .")
new.close()
infile.close()