#!/usr/bin/env bash

# =========================================
# Sistema de Informacion
# =========================================

seccion_sistema() {

    echo "===== SISTEMA ====="

    echo "Hostname:"
    hostname

    echo ""

    echo "Kernel:"
    uname -r

    echo ""

    echo "Arquitectura:"
    uname -m

    echo ""
}

seccion_cpu() {

    echo "===== CPU ====="

    sysctl -n machdep.cpu.brand_string

    echo ""
}

seccion_memoria() {

    echo "===== MEMORIA ====="

    vm_stat

    echo ""
}

seccion_disco() {

    echo "===== DISCO ====="

    df -h

    echo ""
}

seccion_usuarios() {

    echo "===== USUARIOS ====="

    who

    echo ""
}

seccion_red() {

    echo "===== RED ====="

    hostname -I 2>/dev/null || hostname -i

    echo ""
}

mostrar_todo() {

    seccion_sistema
    seccion_cpu
    seccion_memoria
    seccion_disco
    seccion_usuarios
    seccion_red
}

case "$1" in

    --system)

        seccion_sistema
        ;;

    --cpu)

        seccion_cpu
        ;;

    --memory)

        seccion_memoria
        ;;

    --disk)

        seccion_disco
        ;;

    --users)

        seccion_usuarios
        ;;

    --net)

        seccion_red
        ;;

    --all)

        mostrar_todo
        ;;

    *)

        echo "Uso:"
        echo "./sysinfo.sh --all"
        echo "./sysinfo.sh --system"
        echo "./sysinfo.sh --cpu"
        echo "./sysinfo.sh --memory"
        echo "./sysinfo.sh --disk"
        echo "./sysinfo.sh --users"
        echo "./sysinfo.sh --net"
        ;;
esac