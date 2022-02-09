# tris_flutter - Vlad Postu

## Introduzione
Si pone come obiettivo ricreare il famoso gioco Tris con flutter. 


E' stato suddiviso in due classi: 


    -main.dart: la main class contenente la startpage 
    -Tris.dart: la classe contente il gioco e tutti i suoi meccanismi 

Inizialmente si è proiettati in una startpage contente due pulsanti:


    -PLAY vs FRIEND: permette di giocare contro un amico
    -PLAY vs AI: permette di giocare contro una semplice intelligenza artificiale


I widget sono di tipo MaterialUI.

## Svolgimento
Inizialmente è stata creata la struttura del Tris, ovvero 3 righe (Row) allineate centralmente.


Ogni riga contiene 3 celle ognuna iniziamente vuota e con bordi personalizzati per ricreare la struttura standard del gioco. Ogni cella è inizialmente vuota ed è registrata con un numero unico per ognuna di essa e il suo valore è contenuto in un array *scheme*. Al click su una di essa il testo della suddetta verrà modificato in base al valore della variabile *turn*, il quale cambierà ogni volta che si clicca (se è X cambierà in O e viceversa).


Il check in caso di vittoria viene fatto ogni talvolta che si clicca su una cella attraverso un controllo del array *scheme* per verificare se presenta situazioni di vittoria. Se ne trova il gioco viene bloccato permettendo all'utente di resettare attraverso o di ritornare alla startpage attraverso le rispettive icone.

### Intelligenza artificiale
L'ai del progetto è una semplice intelligenza artificiale che rilevando il click su una qualsiasi cella da parte dell'utente sceglierà casualmente una cella (che non è già stata cliccata) e la modificherà come se fosse stata una persona a cliccarci sopra. 


## Conclusioni
Il progetto permette di giocare o contro un amico o contro un'ai al gioco del tris.



