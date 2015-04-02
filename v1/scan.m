%Datei oeffnen
file = fopen('rfc2324.txt','r');
%Textfile einlesen
X = textscan(file,'%s');
lauf = 1;

%Cell array in Sting umwandeln
for i=1:size(X{1,1})
    for j=1:max(size(X{1,1}{i,1}))
        tmp(lauf) = char(X{1,1}{i,1}(j));
        lauf = lauf +1;
    end
end

%String in double Werte umwandeln
AsciValue=double(tmp);

%Zeichen in count gespeichert.
%Haeufigkeit des Zeichen in freq gespeichert.
[freq,count] = hist(AsciValue,unique(AsciValue));
new = [freq; count];

%Zeichen nach Haeufigkeit (absteigend) sortiert.
[s,idx] = sort(new(1,:),'descend');
a = new(:,idx);

%10 haeufigsten Zeichen in cell array speichern.
b = char(a(2,1:10));
for e=1:10
   letter(e)=cellstr(b(e)); 
end

%haeufigkeits plot, wie oft Zeichen vorkommen
figure(1)
plot(a(1,:))
xlabel('Zeichen (sortiert)')
ylabel('H‰ufigkeit')

%bar char, 10 haeufigsten Zeichen
figure(2)
bar(a(1,1:10))
set(gca,'XTickLabel',letter)
xlabel('Zeichen')
ylabel('H‰ufigkeit') 

%pie char, prozentualer anteil des Zeichen
figure(3)
pie(a(1,1:10))
legend(letter,'Location','EastOutside')

%Datei schlieﬂen
fclose(file);