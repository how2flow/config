### Dockerfile

copy this(Dockerfile) and make fixups dir at the same path<br>
edit TODO for your develop env<br>

```
# Dockerfile with how2flow/config:{tag}

# ===== [Edit only '{tag}'] =====
FROM how2flow/config:{tag}
# ==================================

# ======== [Edit you want] =========
ENV ID="user" \
  PASSWORD="password"
# ==================================

# =========== [No Edit] ============
USER root
RUN /postfix.sh $ID $PASSWORD
# ==================================

# ========= [Active or Not] ========

# Use it when you need to distribute
# an official image

# When using postrm script,
# "RUN vim + Plugin Install + qall"
# must be disabled.

# RUN /postrm.sh $ID
# ==================================

# ===== [Edit TODO with ROOT.] =====

# start









# finish
RUN rm -f /*.sh
# ==================================

# ======== [Change Account] ========
USER ${ID}
WORKDIR /home/${ID}
# ==================================

# ===== [Edit TODO with USER.] =====

# start
RUN vim +PluginInstall +qall







# finish
# ==================================

```
