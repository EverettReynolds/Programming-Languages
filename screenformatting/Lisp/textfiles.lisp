#!/usr/bin/sbcl --script

;;; Want to avoid compiler warnings, so add defvar for these variables
    (defvar fl)
    (defvar line)
    (defvar counter 0)
    (setq fl (open "/pub/pounds/CSC330/translations/KJV.txt" ) )

          (loop for line = (read-line fl nil :eof) ; stream, no error, :eof value
                           until (eq line :eof)
						   
                                                    do (write-line line   )
							(setq counter (1+ counter   ) )
                                                        )
							(print counter)
                                                         
                                                       (close fl)
