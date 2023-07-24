# config

config files.

### Dockerfile

copy this(Dockerfile) and make fixups dir at the same path<br>
edit TODO for your develop env<br>

```
# Dockerfile with how2flow/config:{tag}

# ===== Edit only '{distro}' =====
FROM how2flow/config:{distro}
# ================================

# ===== Edit you want =====
ENV ID="user" \
  PASSWORD="password"
# =========================

# ===== No Edit =====
USER root
RUN /postfix.sh $ID $PASSWORD
# ===================

# TODO with root permission ...

# ===== No Edit =====
RUN rm -f /*.sh
# ===================

# ===== No Edit =====
USER ${ID}
WORKDIR /home/${ID}
RUN vim +PluginInstall +qall
# ===================

# TODO with normal permission in /home/${ID} ...

```
