function automacao-etcm --description "Inicia o webapp Automação E-TCM (FastAPI local)"
    set -l dir /mnt/Dados/Dev/Agil/agbot
    if not test -x $dir/.venv/bin/python
        echo "automacao-etcm: venv não encontrado em $dir" >&2
        echo "  (o HD 'Dados' está montado? crie o venv com: python -m venv venv && venv/bin/pip install -r requirements.txt)" >&2
        return 1
    end
    cd $dir; and $dir/.venv/bin/python src/automacao_etcm.py $argv
end
