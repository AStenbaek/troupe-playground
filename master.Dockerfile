FROM node:slim AS base
ENV TROUPE=/Troupe
WORKDIR $TROUPE
RUN npm install -g typescript

FROM base AS builder
ENV TROUPE=/Troupe
WORKDIR $TROUPE
ADD https://github.com/TroupeLang/Troupe.git $TROUPE
RUN apt-get update && apt-get install -qy haskell-stack g++
RUN make all

FROM base
ENV TROUPE=/Troupe
ENV PATH=$TROUPE/bin:$PATH
WORKDIR $TROUPE
COPY --from=builder $TROUPE $TROUPE
CMD ["bash"]
