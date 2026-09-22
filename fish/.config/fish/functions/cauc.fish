function cauc --description "Inicia o webapp CAUC (Streamlit)"
    set -l dir /run/media/ericsson/Dados/Dev/envios_cauc
    if not test -x $dir/venv/bin/python
        echo "cauc: venv não encontrado em $dir" >&2
        echo "  (o HD 'Dados' está montado? crie o venv com: python -m venv venv && venv/bin/pip install -r requirements.txt)" >&2
        return 1
    end
    cd $dir; and $dir/venv/bin/python -m streamlit run src/app_cauc.py --server.headless true $argv
end
