# config

config files.

### Dockerfile

copy this(Dockerfile) and make fixups dir at the same path<br>
edit TODO for your develop env<br>

```
# Dockerfile with how2flow/config:{tag}

# ===== No Edit =====
FROM how2flow/config:ubuntu
# ===================

# ===== Edit you want =====
ENV ID="user"
  PASSWORD="password"
# =========================

# ===== No Edit =====
USER root
WORKDIR /root
COPY fixups fixups
RUN chmod -R +x fixups
RUN ./fixups/postfix $ID $PASSWORD
# ===================

# TODO in /root ...

# ===== No Edit =====
RUN rm -rf fixups
# ===================

# ===== No Edit =====
USER ${ID}
WORKDIR /home/${ID}
RUN vim +PluginInstall +qall
# ===================

# TODO in /home/${ID} ...

```
