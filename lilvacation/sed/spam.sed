#!/bin/sed -f 

s/duan@cs.fsu.edu/account@example.com/g
s/128.186.120.196/192.100.100.100/g
# /duan@$/{$!{ N;s/duan@\ncs.fsu.edu$/account@\nexample.com/g;ty;P;D;:y}}

/duan$/{
       $!{ N        # append the next line when not on the last line
         s/duan\n@cs.fsu.edu$/account\n@example.com/g
         s/duan@\ncs.fsu.edu$/account@\nexample.com/g
                    # now test for a successful substitution, otherwise
                    #+  unpaired "duan" lines would be mis-handled
         t sub-yes  # branch_on_substitute (goto label :sub-yes)
         :sub-not   # a label (not essential; here to self document)
                    # if no substituion, print only the first line
         P          # pattern_first_line_print
         D          # pattern_ltrunc(line+nl)_top/cycle
         :sub-yes   # a label (the goto target of the 't' branch)
                    # fall through to final auto-pattern_print (2 lines)
       }    
     }
s/cs.fsu.edu/example.com/g
# EOF