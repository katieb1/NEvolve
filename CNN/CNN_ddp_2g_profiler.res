GPU: 1
label shape before reshape: torch.Size([16, 32])
net output shape: torch.Size([512, 5])
label tensor shpe: torch.Size([512])
label shape before reshape: torch.Size([16, 32])
net output shape: torch.Size([512, 5])
label tensor shpe: torch.Size([512])
GPU: 0
label shape before reshape: torch.Size([16, 32])
net output shape: torch.Size([512, 5])
label tensor shpe: torch.Size([512])
label shape before reshape: torch.Size([16, 32])
net output shape: torch.Size([512, 5])
label tensor shpe: torch.Size([512])
Total time run: 0.6682 minutes
         4166 function calls (4109 primitive calls) in 43.808 seconds

   Ordered by: internal time

   ncalls  tottime  percall  cumtime  percall filename:lineno(function)
        2   43.763   21.882   43.763   21.882 {method 'poll' of 'select.poll' objects}
        3    0.031    0.010    0.031    0.010 {built-in method _posixsubprocess.fork_exec}
       12    0.002    0.000    0.002    0.000 {built-in method posix.waitpid}
        7    0.001    0.000    0.001    0.000 {built-in method marshal.loads}
        4    0.000    0.000    0.010    0.002 synchronize.py:50(__init__)
        4    0.000    0.000    0.001    0.000 {method 'dump' of '_pickle.Pickler' objects}
        2    0.000    0.000    0.026    0.013 popen_spawn_posix.py:38(_launch)
       18    0.000    0.000    0.000    0.000 {built-in method builtins.__build_class__}
        1    0.000    0.000   43.806   43.806 spawn.py:161(spawn)
      7/4    0.000    0.000    0.003    0.001 <frozen importlib._bootstrap>:663(_load_unlocked)
        6    0.000    0.000    0.000    0.000 util.py:186(__init__)
       34    0.000    0.000    0.000    0.000 {built-in method posix.stat}
        1    0.000    0.000   43.805   43.805 spawn.py:136(start_processes)
        3    0.000    0.000    0.031    0.010 util.py:447(spawnv_passfds)
        2    0.000    0.000    0.000    0.000 {built-in method io.open}
        6    0.000    0.000    0.000    0.000 {method 'update' of 'dict' objects}
        2    0.000    0.000    0.026    0.013 popen_fork.py:16(__init__)
        1    0.000    0.000    0.000    0.000 argparse.py:1796(_parse_known_args)
        2    0.000    0.000    0.000    0.000 process.py:72(__init__)
        2    0.000    0.000    0.028    0.014 process.py:101(start)
      114    0.000    0.000    0.000    0.000 {built-in method builtins.hasattr}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:914(get_data)
        4    0.000    0.000    0.011    0.003 context.py:64(Lock)
       10    0.000    0.000    0.008    0.001 semaphore_tracker.py:38(ensure_running)
        2    0.000    0.000    0.000    0.000 spawn.py:139(get_preparation_data)
        8    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1356(find_spec)
        2    0.000    0.000    0.011    0.005 queues.py:330(__init__)
        4    0.000    0.000    0.000    0.000 synchronize.py:84(_cleanup)
        8    0.000    0.000    0.008    0.001 semaphore_tracker.py:89(_send)
       32    0.000    0.000    0.000    0.000 random.py:256(choice)
        2    0.000    0.000   43.763   21.882 connection.py:907(wait)
       46    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:416(parent)
       11    0.000    0.000    0.001    0.000 argparse.py:1328(add_argument)
        2    0.000    0.000    0.011    0.006 context.py:109(SimpleQueue)
        7    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap>:882(_find_spec)
       19    0.000    0.000    0.000    0.000 {built-in method posix.close}
        4    0.000    0.000    0.000    0.000 tempfile.py:153(__next__)
      6/5    0.000    0.000    0.000    0.000 sre_parse.py:469(_parse)
        4    0.000    0.000    0.000    0.000 weakref.py:165(__setitem__)
        7    0.000    0.000    0.002    0.000 <frozen importlib._bootstrap_external>:793(get_code)
        2    0.000    0.000   43.765   21.883 spawn.py:57(join)
        6    0.000    0.000    0.000    0.000 util.py:205(__call__)
     12/4    0.000    0.000    0.000    0.000 sre_compile.py:71(_compile)
        4    0.000    0.000    0.000    0.000 reduction.py:38(__init__)
    45/39    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap>:1009(_handle_fromlist)
       11    0.000    0.000    0.000    0.000 argparse.py:1465(_get_optional_kwargs)
       95    0.000    0.000    0.000    0.000 {built-in method builtins.getattr}
        6    0.000    0.000    0.000    0.000 {method 'copy' of 'dict' objects}
       11    0.000    0.000    0.000    0.000 argparse.py:159(__init__)
        3    0.000    0.000    0.000    0.000 gettext.py:474(find)
        7    0.000    0.000    0.000    0.000 {method 'read' of '_io.FileIO' objects}
        4    0.000    0.000    0.000    0.000 tempfile.py:142(rng)
        9    0.000    0.000    0.000    0.000 gettext.py:211(_expand_lang)
        2    0.000    0.000   43.763   21.882 selectors.py:402(select)
       32    0.000    0.000    0.000    0.000 random.py:224(_randbelow)
       14    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:271(cache_from_source)
       26    0.000    0.000    0.001    0.000 re.py:273(_compile)
        3    0.000    0.000    0.000    0.000 subprocess.py:272(_args_from_interpreter_flags)
       14    0.000    0.000    0.000    0.000 posixpath.py:75(join)
        8    0.000    0.000    0.000    0.000 {built-in method posix.write}
      7/4    0.000    0.000    0.004    0.001 <frozen importlib._bootstrap>:978(_find_and_load)
        4    0.000    0.000    0.000    0.000 synchronize.py:114(_make_name)
        1    0.000    0.000   43.808   43.808 CNN_ddp.py:23(main)
       73    0.000    0.000    0.000    0.000 {method 'join' of 'str' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:157(_get_module_lock)
      7/4    0.000    0.000    0.004    0.001 <frozen importlib._bootstrap>:948(_find_and_load_unlocked)
       10    0.000    0.000    0.000    0.000 {built-in method posix.pipe}
       47    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:56(_path_join)
        4    0.000    0.000    0.000    0.000 {built-in method _multiprocessing.sem_unlink}
      220    0.000    0.000    0.000    0.000 {built-in method builtins.isinstance}
      263    0.000    0.000    0.000    0.000 {method 'append' of 'list' objects}
     13/5    0.000    0.000    0.000    0.000 sre_parse.py:174(getwidth)
        4    0.000    0.000    0.000    0.000 weakref.py:109(remove)
  224/212    0.000    0.000    0.000    0.000 {built-in method builtins.len}
       16    0.000    0.000    0.000    0.000 {built-in method builtins.next}
        3    0.000    0.000    0.000    0.000 argparse.py:1247(__init__)
       95    0.000    0.000    0.000    0.000 {method 'rpartition' of 'str' objects}
       47    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:58(<listcomp>)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1240(_get_spec)
       14    0.000    0.000    0.000    0.000 os.py:676(__getitem__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:504(_init_module_attrs)
        4    0.000    0.000    0.000    0.000 util.py:171(register_after_fork)
        1    0.000    0.000    0.000    0.000 spawn.py:45(__init__)
        4    0.000    0.000    0.001    0.000 reduction.py:58(dump)
        4    0.000    0.000    0.000    0.000 connection.py:957(reduce_connection)
       67    0.000    0.000    0.000    0.000 sre_parse.py:164(__getitem__)
        4    0.000    0.000    0.010    0.002 synchronize.py:161(__init__)
        2    0.000    0.000    0.000    0.000 spawn.py:78(get_command_line)
        5    0.000    0.000    0.002    0.000 popen_fork.py:25(poll)
        4    0.000    0.000    0.001    0.000 sre_compile.py:759(compile)
        7    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:523(_compile_bytecode)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:574(spec_from_file_location)
      7/4    0.000    0.000    0.003    0.001 <frozen importlib._bootstrap_external>:722(exec_module)
        3    0.000    0.000    0.000    0.000 selectors.py:234(register)
        2    0.000    0.000    0.000    0.000 selectors.py:347(__init__)
        1    0.000    0.000    0.000    0.000 {function Random.seed at 0x2b7a9d4470e0}
        4    0.000    0.000    0.000    0.000 connection.py:117(__init__)
      5/4    0.000    0.000    0.000    0.000 sre_parse.py:411(_parse_sub)
       11    0.000    0.000    0.000    0.000 argparse.py:1385(_add_action)
       54    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:222(_verbose_message)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:78(acquire)
        2    0.000    0.000    0.002    0.001 process.py:133(join)
        1    0.000    0.000    0.000    0.000 queues.py:10(<module>)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1351(_get_spec)
        4    0.000    0.000    0.000    0.000 sre_compile.py:536(_compile_info)
        4    0.000    0.000    0.000    0.000 tempfile.py:156(<listcomp>)
        2    0.000    0.000    0.000    0.000 selectors.py:209(__init__)
        3    0.000    0.000    0.000    0.000 selectors.py:351(register)
        4    0.000    0.000    0.000    0.000 process.py:326(__reduce__)
        1    0.000    0.000    0.001    0.001 argparse.py:1625(__init__)
        1    0.000    0.000    0.000    0.000 synchronize.py:11(<module>)
        1    0.000    0.000    0.001    0.001 popen_spawn_posix.py:1(<module>)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:576(module_from_spec)
       27    0.000    0.000    0.000    0.000 sre_parse.py:233(__next)
       58    0.000    0.000    0.000    0.000 {method 'getrandbits' of '_random.Random' objects}
       34    0.000    0.000    0.000    0.000 argparse.py:1299(register)
       10    0.000    0.000    0.000    0.000 {method 'format' of 'str' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:103(release)
        2    0.000    0.000    0.000    0.000 connection.py:506(Pipe)
       29    0.000    0.000    0.000    0.000 {method 'encode' of 'str' objects}
       73    0.000    0.000    0.000    0.000 {method 'get' of 'dict' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:318(__exit__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:438(_classify_pyc)
        2    0.000    0.000    0.000    0.000 util.py:433(_flush_std_streams)
        1    0.000    0.000    0.000    0.000 spawn.py:49(<dictcomp>)
       11    0.000    0.000    0.000    0.000 argparse.py:588(_format_args)
        2    0.000    0.000    0.026    0.013 popen_spawn_posix.py:30(__init__)
       15    0.000    0.000    0.000    0.000 {built-in method _thread.allocate_lock}
       20    0.000    0.000    0.000    0.000 {built-in method builtins.setattr}
       25    0.000    0.000    0.001    0.000 re.py:234(compile)
        2    0.000    0.000    0.000    0.000 selectors.py:268(close)
        4    0.000    0.000    0.000    0.000 weakref.py:336(__new__)
        2    0.000    0.000    0.028    0.014 context.py:281(_Popen)
      108    0.000    0.000    0.000    0.000 {method 'rstrip' of 'str' objects}
        2    0.000    0.000    0.000    0.000 posixpath.py:338(normpath)
        4    0.000    0.000    0.000    0.000 {method 'flush' of '_io.TextIOWrapper' objects}
        4    0.000    0.000    0.000    0.000 enum.py:841(__and__)
        4    0.000    0.000    0.000    0.000 connection.py:130(__del__)
        1    0.000    0.000    0.000    0.000 spawn.py:11(<module>)
        2    0.000    0.000    0.000    0.000 context.py:248(get_start_method)
       11    0.000    0.000    0.000    0.000 argparse.py:1576(_add_action)
       35    0.000    0.000    0.000    0.000 {built-in method _imp.acquire_lock}
       14    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:62(_path_split)
        2    0.000    0.000    0.000    0.000 {built-in method select.poll}
       16    0.000    0.000    0.000    0.000 {method 'match' of 're.Pattern' objects}
       22    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:74(_path_stat)
        4    0.000    0.000    0.000    0.000 sre_compile.py:276(_optimize_charset)
        3    0.000    0.000    0.000    0.000 copyreg.py:96(_slotnames)
        9    0.000    0.000    0.000    0.000 locale.py:384(normalize)
       11    0.000    0.000    0.000    0.000 argparse.py:808(__init__)
       26    0.000    0.000    0.000    0.000 argparse.py:1303(_registry_get)
        1    0.000    0.000    0.000    0.000 argparse.py:1761(parse_known_args)
        1    0.000    0.000    0.000    0.000 runpy.py:8(<module>)
       42    0.000    0.000    0.000    0.000 {built-in method builtins.min}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:311(__enter__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:369(_get_cached)
        4    0.000    0.000    0.000    0.000 sre_parse.py:913(parse)
        4    0.000    0.000    0.000    0.000 reduction.py:187(DupFd)
       45    0.000    0.000    0.000    0.000 {method 'endswith' of 'str' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:401(_check_name_wrapper)
       18    0.000    0.000    0.000    0.000 os.py:754(encode)
       17    0.000    0.000    0.000    0.000 posixpath.py:41(_get_sep)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:81(add)
        4    0.000    0.000    0.000    0.000 connection.py:168(fileno)
        2    0.000    0.000    0.000    0.000 argparse.py:1554(__init__)
        3    0.000    0.000    0.000    0.000 gettext.py:514(translation)
        4    0.000    0.000    0.000    0.000 synchronize.py:100(__getstate__)
        4    0.000    0.000    0.008    0.002 semaphore_tracker.py:81(register)
        1    0.000    0.000    0.000    0.000 popen_fork.py:1(<module>)
        7    0.000    0.000    0.000    0.000 {built-in method _imp._fix_co_filename}
      7/4    0.000    0.000    0.002    0.000 {built-in method builtins.exec}
      9/4    0.000    0.000    0.002    0.000 <frozen importlib._bootstrap>:211(_call_with_frames_removed)
       14    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:403(cached)
       21    0.000    0.000    0.000    0.000 sre_parse.py:254(get)
        4    0.000    0.000    0.000    0.000 weakref.py:341(__init__)
       10    0.000    0.000    0.000    0.000 argparse.py:850(__init__)
        4    0.000    0.000    0.000    0.000 synchronize.py:90(_make_methods)
        4    0.000    0.000    0.000    0.000 semaphore_tracker.py:85(unregister)
        1    0.000    0.000    0.001    0.001 semaphore_tracker.py:14(<module>)
       14    0.000    0.000    0.000    0.000 {built-in method builtins.max}
       44    0.000    0.000    0.000    0.000 {method 'startswith' of 'str' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:58(__init__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:147(__enter__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:176(cb)
        2    0.000    0.000    0.000    0.000 os.py:684(__setitem__)
       12    0.000    0.000    0.000    0.000 genericpath.py:16(exists)
       28    0.000    0.000    0.000    0.000 sre_parse.py:160(__len__)
        2    0.000    0.000    0.000    0.000 _weakrefset.py:38(_remove)
        4    0.000    0.000    0.000    0.000 context.py:349(set_spawning_popen)
        1    0.000    0.000    0.000    0.000 argparse.py:1843(take_action)
        2    0.000    0.000    0.002    0.001 popen_fork.py:41(wait)
        2    0.000    0.000    0.000    0.000 {built-in method posix.getcwd}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:93(_path_isfile)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:471(_validate_timestamp_pyc)
        7    0.000    0.000    0.001    0.000 <frozen importlib._bootstrap_external>:1272(find_spec)
        3    0.000    0.000    0.000    0.000 argparse.py:1505(_get_handler)
        2    0.000    0.000    0.000    0.000 {built-in method posix.putenv}
       43    0.000    0.000    0.000    0.000 {built-in method posix.fspath}
        7    0.000    0.000    0.000    0.000 {built-in method builtins.any}
       21    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:51(_r_long)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:951(path_stats)
       11    0.000    0.000    0.000    0.000 types.py:164(__get__)
        4    0.000    0.000    0.000    0.000 sre_compile.py:598(_code)
       19    0.000    0.000    0.000    0.000 sre_parse.py:172(append)
        4    0.000    0.000    0.000    0.000 sre_parse.py:224(__init__)
       11    0.000    0.000    0.000    0.000 argparse.py:204(__init__)
       14    0.000    0.000    0.000    0.000 context.py:346(get_spawning_popen)
        4    0.000    0.000    0.000    0.000 process.py:85(<genexpr>)
       11    0.000    0.000    0.000    0.000 argparse.py:1514(_check_conflict)
       11    0.000    0.000    0.000    0.000 argparse.py:2467(_get_formatter)
       21    0.000    0.000    0.000    0.000 {built-in method from_bytes}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:884(__init__)
        4    0.000    0.000    0.000    0.000 sre_compile.py:249(_compile_charset)
       12    0.000    0.000    0.000    0.000 sre_parse.py:111(__init__)
        8    0.000    0.000    0.000    0.000 sre_parse.py:343(_escape)
        1    0.000    0.000    0.000    0.000 random.py:97(seed)
        8    0.000    0.000    0.000    0.000 process.py:90(_check_closed)
       11    0.000    0.000    0.000    0.000 argparse.py:1501(_pop_action_class)
       11    0.000    0.000    0.000    0.000 argparse.py:1734(_add_action)
        3    0.000    0.000    0.000    0.000 gettext.py:585(dgettext)
        2    0.000    0.000    0.000    0.000 {method 'getbuffer' of '_io.BytesIO' objects}
       24    0.000    0.000    0.000    0.000 {method 'pop' of 'dict' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:35(_new_module)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:369(__init__)
       21    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:855(__enter__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:84(_path_is_mode_type)
       10    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:1203(_path_importer_cache)
        8    0.000    0.000    0.000    0.000 enum.py:289(__call__)
      5/4    0.000    0.000    0.000    0.000 sre_compile.py:461(_get_literal_prefix)
        1    0.000    0.000    0.000    0.000 argparse.py:2345(_get_values)
        4    0.000    0.000    0.000    0.000 argparse.py:2401(_get_value)
        2    0.000    0.000    0.000    0.000 queues.py:342(__getstate__)
        2    0.000    0.000    0.000    0.000 {method 'write' of '_io.BufferedWriter' objects}
       35    0.000    0.000    0.000    0.000 {built-in method _imp.release_lock}
        2    0.000    0.000    0.001    0.001 {built-in method builtins.__import__}
        3    0.000    0.000    0.000    0.000 {built-in method builtins.sorted}
        2    0.000    0.000    0.000    0.000 {method 'index' of 'list' objects}
       28    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:321(<genexpr>)
       21    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:859(__exit__)
        8    0.000    0.000    0.000    0.000 sre_compile.py:595(isstring)
       11    0.000    0.000    0.000    0.000 sre_parse.py:286(tell)
        4    0.000    0.000    0.000    0.000 sre_parse.py:897(fix_flags)
        3    0.000    0.000    0.000    0.000 selectors.py:21(_fileobj_to_fd)
        2    0.000    0.000    0.000    0.000 process.py:53(_cleanup)
        2    0.000    0.000    0.000    0.000 connection.py:923(<listcomp>)
       11    0.000    0.000    0.000    0.000 argparse.py:581(format)
       11    0.000    0.000    0.000    0.000 argparse.py:572(_metavar_formatter)
        2    0.000    0.000    0.000    0.000 argparse.py:1375(add_argument_group)
        4    0.000    0.000    0.000    0.000 {built-in method _weakref._remove_dead_weakref}
        7    0.000    0.000    0.000    0.000 {built-in method __new__ of type object at 0x561433ce18e0}
        2    0.000    0.000    0.000    0.000 {method 'copy' of 'list' objects}
        1    0.000    0.000    0.000    0.000 posixpath.py:144(basename)
        8    0.000    0.000    0.000    0.000 enum.py:531(__new__)
       13    0.000    0.000    0.000    0.000 sre_parse.py:249(match)
        2    0.000    0.000    0.000    0.000 selectors.py:275(_key_from_fd)
        2    0.000    0.000    0.000    0.000 process.py:215(exitcode)
        1    0.000    0.000    0.000    0.000 argparse.py:1941(consume_positionals)
        1    0.000    0.000    0.000    0.000 argparse.py:2071(_match_argument)
        1    0.000    0.000    0.000    0.000 synchronize.py:210(Condition)
        1    0.000    0.000    0.000    0.000 semaphore_tracker.py:27(SemaphoreTracker)
        4    0.000    0.000    0.000    0.000 {built-in method _sre.compile}
       22    0.000    0.000    0.000    0.000 {built-in method posix.getpid}
        7    0.000    0.000    0.000    0.000 {built-in method _imp.is_frozen}
       13    0.000    0.000    0.000    0.000 {method 'replace' of 'str' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:143(__init__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:151(__exit__)
        2    0.000    0.000    0.000    0.000 posixpath.py:64(isabs)
        2    0.000    0.000    0.000    0.000 sre_compile.py:432(_generate_overlap_table)
        4    0.000    0.000    0.000    0.000 sre_parse.py:76(__init__)
        2    0.000    0.000    0.000    0.000 selectors.py:63(__init__)
        3    0.000    0.000    0.000    0.000 <string>:1(__new__)
        4    0.000    0.000    0.000    0.000 context.py:196(get_start_method)
        1    0.000    0.000    0.000    0.000 queues.py:34(Queue)
        1    0.000    0.000    0.000    0.000 synchronize.py:360(Barrier)
        1    0.000    0.000    0.000    0.000 runpy.py:23(_TempModule)
        1    0.000    0.000    0.000    0.000 {built-in method posix.uname}
       27    0.000    0.000    0.000    0.000 {method 'find' of 'str' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:307(__init__)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:719(find_spec)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:792(find_spec)
        3    0.000    0.000    0.000    0.000 os.py:758(decode)
        3    0.000    0.000    0.000    0.000 os.py:806(fsencode)
        3    0.000    0.000    0.000    0.000 _collections_abc.py:657(get)
       11    0.000    0.000    0.000    0.000 enum.py:633(value)
        5    0.000    0.000    0.000    0.000 sre_compile.py:423(_simple)
       10    0.000    0.000    0.000    0.000 sre_parse.py:81(groups)
        5    0.000    0.000    0.000    0.000 sre_parse.py:168(__setitem__)
        3    0.000    0.000    0.000    0.000 {method 'register' of 'select.poll' objects}
        3    0.000    0.000    0.000    0.000 subprocess.py:262(_optim_args_from_interpreter_flags)
        6    0.000    0.000    0.000    0.000 util.py:44(sub_debug)
        7    0.000    0.000    0.000    0.000 context.py:186(get_context)
        1    0.000    0.000    0.000    0.000 argparse.py:1030(__init__)
        1    0.000    0.000    0.000    0.000 argparse.py:1864(consume_optional)
        1    0.000    0.000    0.000    0.000 queues.py:328(SimpleQueue)
        1    0.000    0.000    0.000    0.000 synchronize.py:46(SemLock)
        6    0.000    0.000    0.000    0.000 spawn.py:87(<genexpr>)
        2    0.000    0.000    0.000    0.000 spawn.py:121(_check_not_importing_main)
        2    0.000    0.000    0.000    0.000 {method 'setter' of 'property' objects}
        1    0.000    0.000    0.000    0.000 {method 'fileno' of '_io.TextIOWrapper' objects}
        5    0.000    0.000    0.000    0.000 {method 'split' of 'str' objects}
        4    0.000    0.000    0.000    0.000 {method 'discard' of 'set' objects}
        2    0.000    0.000    0.000    0.000 {method 'clear' of 'dict' objects}
       32    0.000    0.000    0.000    0.000 {method 'bit_length' of 'int' objects}
        7    0.000    0.000    0.000    0.000 sre_compile.py:453(_get_iscased)
        2    0.000    0.000    0.000    0.000 sre_compile.py:492(_get_charset_prefix)
        2    0.000    0.000    0.000    0.000 selectors.py:202(__exit__)
        1    0.000    0.000    0.000    0.000 context.py:232(get_context)
        2    0.000    0.000    0.000    0.000 process.py:196(daemon)
        1    0.000    0.000    0.000    0.000 semaphore_tracker.py:29(__init__)
        4    0.000    0.000    0.000    0.000 popen_spawn_posix.py:17(__init__)
        1    0.000    0.000    0.000    0.000 popen_fork.py:13(Popen)
        4    0.000    0.000    0.000    0.000 {method 'find' of 'bytearray' objects}
       14    0.000    0.000    0.000    0.000 {built-in method _thread.get_ident}
        2    0.000    0.000    0.000    0.000 {built-in method posix.WIFSIGNALED}
        9    0.000    0.000    0.000    0.000 {method 'lower' of 'str' objects}
       40    0.000    0.000    0.000    0.000 {method 'setdefault' of 'dict' objects}
        8    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:40(_relax_case)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap>:424(has_location)
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:909(get_filename)
        1    0.000    0.000    0.000    0.000 sre_parse.py:96(closegroup)
        3    0.000    0.000    0.000    0.000 selectors.py:215(_fileobj_lookup)
        6    0.000    0.000    0.000    0.000 context.py:352(assert_spawning)
        8    0.000    0.000    0.000    0.000 process.py:36(current_process)
        2    0.000    0.000    0.000    0.000 process.py:238(sentinel)
        4    0.000    0.000    0.000    0.000 connection.py:163(writable)
        4    0.000    0.000    0.000    0.000 connection.py:360(_close)
        1    0.000    0.000    0.000    0.000 argparse.py:1746(_get_positional_actions)
        1    0.000    0.000    0.000    0.000 argparse.py:1754(parse_args)
        2    0.000    0.000    0.000    0.000 argparse.py:2109(_parse_optional)
        1    0.000    0.000    0.000    0.000 argparse.py:2212(_get_nargs_pattern)
        3    0.000    0.000    0.000    0.000 gettext.py:624(gettext)
        2    0.000    0.000    0.000    0.000 semaphore_tracker.py:34(getfd)
        4    0.000    0.000    0.000    0.000 popen_spawn_posix.py:34(duplicate_for_child)
        3    0.000    0.000    0.000    0.000 {method 'get' of 'mappingproxy' objects}
        1    0.000    0.000    0.000    0.000 {built-in method _imp.is_builtin}
       26    0.000    0.000    0.000    0.000 {built-in method builtins.callable}
        4    0.000    0.000    0.000    0.000 {built-in method builtins.id}
       11    0.000    0.000    0.000    0.000 {method 'lstrip' of 'str' objects}
        6    0.000    0.000    0.000    0.000 {method 'add' of 'set' objects}
        9    0.000    0.000    0.000    0.000 {method 'items' of 'dict' objects}
        8    0.000    0.000    0.000    0.000 {method 'extend' of 'list' objects}
        4    0.000    0.000    0.000    0.000 {method 'remove' of 'list' objects}
        7    0.000    0.000    0.000    0.000 <frozen importlib._bootstrap_external>:719(create_module)
        1    0.000    0.000    0.000    0.000 re.py:172(match)
        2    0.000    0.000    0.000    0.000 sre_compile.py:65(_combine_flags)
        1    0.000    0.000    0.000    0.000 sre_parse.py:84(opengroup)
        2    0.000    0.000    0.000    0.000 selectors.py:199(__enter__)
        1    0.000    0.000    0.000    0.000 random.py:88(__init__)
        1    0.000    0.000    0.000    0.000 {method 'disable' of '_lsprof.Profiler' objects}
        4    0.000    0.000    0.000    0.000 util.py:48(debug)
        1    0.000    0.000    0.000    0.000 context.py:212(_check_available)
        2    0.000    0.000    0.000    0.000 process.py:204(authkey)
        2    0.000    0.000    0.000    0.000 spawn.py:33(_python_version_check)
        4    0.000    0.000    0.000    0.000 connection.py:134(_check_closed)
        1    0.000    0.000    0.000    0.000 argparse.py:1232(__init__)
        1    0.000    0.000    0.000    0.000 argparse.py:1747(<listcomp>)
        1    0.000    0.000    0.000    0.000 argparse.py:1971(<listcomp>)
        1    0.000    0.000    0.000    0.000 argparse.py:2093(_match_arguments_partial)
        1    0.000    0.000    0.000    0.000 argparse.py:2427(_check_value)
        1    0.000    0.000    0.000    0.000 queues.py:286(JoinableQueue)
        1    0.000    0.000    0.000    0.000 synchronize.py:123(Semaphore)
        1    0.000    0.000    0.000    0.000 synchronize.py:159(Lock)
        1    0.000    0.000    0.000    0.000 synchronize.py:184(RLock)
        1    0.000    0.000    0.000    0.000 synchronize.py:321(Event)
        3    0.000    0.000    0.000    0.000 spawn.py:45(get_executable)
        1    0.000    0.000    0.000    0.000 runpy.py:46(_ModifiedArgv0)
        1    0.000    0.000    0.000    0.000 runpy.py:160(_Error)
        1    0.000    0.000    0.000    0.000 popen_spawn_posix.py:26(Popen)
        2    0.000    0.000    0.000    0.000 {built-in method posix.WEXITSTATUS}
        1    0.000    0.000    0.000    0.000 {method 'rfind' of 'str' objects}
        9    0.000    0.000    0.000    0.000 {method 'reverse' of 'list' objects}
        4    0.000    0.000    0.000    0.000 sre_parse.py:162(__delitem__)
        4    0.000    0.000    0.000    0.000 connection.py:158(readable)
        1    0.000    0.000    0.000    0.000 argparse.py:605(<listcomp>)
        1    0.000    0.000    0.000    0.000 argparse.py:879(__call__)
        1    0.000    0.000    0.000    0.000 synchronize.py:142(BoundedSemaphore)
        1    0.000    0.000    0.000    0.000 popen_spawn_posix.py:16(_DupFd)
        1    0.000    0.000    0.000    0.000 {method 'group' of 're.Match' objects}
        2    0.000    0.000    0.000    0.000 {built-in method posix.WIFEXITED}
        1    0.000    0.000    0.000    0.000 {built-in method builtins.iter}
        4    0.000    0.000    0.000    0.000 {built-in method builtins.ord}
        2    0.000    0.000    0.000    0.000 {method 'keys' of 'dict' objects}
        3    0.000    0.000    0.000    0.000 {method 'decode' of 'bytes' objects}


