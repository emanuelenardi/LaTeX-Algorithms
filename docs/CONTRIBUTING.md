# Contributing to this repository

## Requisiti per la compilazione

Per poter compilare questo progetto è necessario avere sulla propria macchina:

- git
- un'installazione completa di [TeX-Live](https://www.tug.org/texlive/acquire-netinstall.html) 2020 (servono all'incirca 7GB liberi sul disco);
- Python (`2.x.x` o `3..x.x` è indifferente);
- la libreria Python [`pygmetize`](https://pygments.org/) (per la colorazione del codice all'interno del documento);
- java (per la compilazione dei documenti tramite [arara](https://github.com/islandoftex/arara)).

### Installazione dei requisiti su Windows

Per l'installazione su windows eseguire i passi nei seguenti link:

- installare git ([download diretto](https://git-scm.com/download/win));
- installare Tex-Live per Windows ([download diretto](http://mirror.ctan.org/systems/texlive/tlnet/install-tl-windows.exe));
- installare una versione di [Python](https://www.python.org/downloads/), dopodiché eseguire `pip install Pygments` su un terminale;
- installare [Java](https://www.java.com/en/download/).

### Installazione dei requisiti su linux

Su linux è sufficiente eseguire le seguenti righe
```bash
sudo apt -y update && sudo apt -y upgrade && sudo apt autoremove
sudo apt install git
sudo apt install -y default-jre default-jdk
sudo apt install -y python3 python3-pygments
sudo apt-get install -y texlive-full
tlmgr init-usertree # initialize tlmgr
tlmgr update --self --all
```

### Controllo installazione

Per accertarti di avere tutti gli strumenti adatti per compilare questo progetto (sia su linux che su windows) esegui le seguenti righe su un terminale:
```bash
git --version
python --version
pygmentize -V
tlmgr --version
arara --version
```

## Come compilare il progetto

Scarica una copia del progetto
```bash
git clone https://github.com/emanuelenardi/latex-algorithms.git
```

Nella cartelle del progetto `src/windows/scripts` e `src/unix/scripts` sono presenti gli _scripts_ necessari per la compilazione del progetto in Windows e Linux/Mac rispettivamente.

Per compilare il progetto, una volta soddisfatti i requisiti, **eseguire dalla cartella** `root`:

```bash
./src/scripts/unix/compile-project.sh     # linux/mac
./src/scripts/windows/compile-project.bat # windows
```
alla fine dell'esecuzione ispezionando la cartella `build` troverai una cartella `chapters` con tutti i singoli capitoli compilati e il file `main.pdf` completo di tutti i capitoli.

Lo script è composto a sua volta da altri script, contenuti nella stessa cartella, quali:

- `reset-project`: cancella il preambolo precompilato del documento principale e quello degli algoritmi, cancella inoltre il contenuto della cartella `build`;
- `compile-preambles`: precompila i preamboli del documento principale e degli algoritmi per migliorare la velocità di compilazione;
- `compile-chapters`: compila ogni singolo capitolo e li mette nella cartella `build/chapters`;
- `compile-main`: compila solo il documento principale.

I nomi degli scripts sono equivalenti per la piattaforma Windows utilizzando gli script sull'omonima cartella.

Ogni script può essere eseguito anche singolarmente.

### Effettuare modifiche al preambolo del documento

Nel caso si eseguissero modifiche al file `settings/preamble.main.sty` è necessario compilarlo nuovamente per vedere il risultato delle proprie modifiche riflesse sul documento finale.

```bash
unix/scripts/compile-preambles # pre-compilo i preamboli
```

## Cosa succede quando si pubblica il codice su Github

Quando il codice viene pubblicato tramite un `push` sui branch `main` e `preview` viene eseguita la github action [`build`](https://github.com/emanuelenardi/latex-algorithms/blob/main/.github/workflows/build.yml).

La regola build è suddivisa in tre _job_ i quali svolgono compiti specifici.

- job: `build_docs`:

    1. viene creata una macchina virtuale con l'ultima versione di Ubuntu;
    2. vengono installate le dipendenze (Step 1);
    3. viene effettuta una copia del progetto (Step 2);
    4. viene compilato il progetto (Step 3);
    5. viene creato un nuovo _lightweight tag_ (un tag non annotato) (Step 4);
    6. viene creato il nome dello zip sulla base del nuovo tag e della data e ora corrente     (Step 5);
    7. viene creata una cartella contenente la cartella dei singoli capitoli e del main     completo (Step 6);
    8. viene inviata una notifica al gruppo telegram "[Discussione Dispensa Algoritmi](https://t.me/DiscussioneDispensaAlgoritmi)" nel caso una delle fasi precedenti fallisca (molto     probabilmente è fallita la compilazione del documento principale);
    9. se tutte le operazioni precedenti vanno a buon fine allora viene creato un artefatto che viene caricato su Github e che ci permetterà di comunicare con gli altri _job_; è possibile scaricarlo dalla tab _Actions_ (Step 7).

I _job_ `send_docs` e `create_release` dipendono dal _job_ `build_docs`, quindi aspetteranno che questo venga completato con successo, dopodiché verranno eseguiti in parallelo.

- job: `send_docs`:

    1. scarica una copia dell'artefatto (Step 1);
    2. crea un file zip con l'artefatto (Step 2);
    3. manda il file zip su un canale privato collegato al gruppo "[Discussione Dispensa Algoritmi](https://t.me/DiscussioneDispensaAlgoritmi)" il quale, essendo il gruppo di discussione associato al canale, riceverà una copia del messaggio e verrà pinnato.

- job: `create_release`

    1. se il tag aggiornato è una versione major o una version minor allora verrà creata una release che si chiamerà `Relase <tag>` (Step 1);
    2. scarica una copia dell'artefatto (Step 2);
    3. carica una copia dell'artefatto sui download della release (Step 3).
