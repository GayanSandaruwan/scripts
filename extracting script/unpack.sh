
extract() {
    for plik in "$@"; do
        echo $(file "$plik")
        tar -xvaf "$plik" 2>/dev/null && 
            return 0
        case $(file "$plik") in
            *bzip2*)    bzip2 -dk "$plik"        ;;
            *gzip*)     gunzip "$plik"           ;;
            *'7-zip'*)  7z x "$plik"             ;;
            *zip*)      unzip "$plik"            ;;
            *Zip*)      unzip "$plik"            ;;
            *xz*)       unxz  "$plik"            ;;
            *XZ*)       unxz  "$plik"            ;;
            *)          1>&2 echo "Unknown archive '$plik'"; return 1 ;;
        esac
    done
}

extract archive.bz2
