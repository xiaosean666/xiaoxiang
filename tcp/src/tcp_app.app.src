{application, tcp_app, [
    {description, "tcp application"}
    ,{vsn, "1.0.0"}
    ,{mod, {tcp_app, []}}
    ,{applications, [kernel, stdlib]}
    ,{modules, []}
    ,{registered, []}
    ,{env, [
        {port, 10086}
        ,{tcp_options, [
            binary
            ,{packet, 0}
            ,{active, false}
            ,{reuseaddr, true}
            ,{nodelay, false}
            ,{delay_send, true}
            ,{exit_on_close, false}
            ,{send_timeout, 10000}
            ,{send_timeout_close, false}
        ]}
        ,{tcp_acceptor_num, 3}
    ]}
]}.