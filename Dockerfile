FROM haskell:8.6.5 AS kcot-base

RUN apt update
RUN apt upgrade -y
RUN apt -y install zlib1g-dev
WORKDIR /home
RUN cabal v1-update
RUN git clone https://github.com/calledtoconstruct/kata-checkout-order-total
WORKDIR /home/kata-checkout-order-total/haskell
RUN cabal install --only-dependencies
