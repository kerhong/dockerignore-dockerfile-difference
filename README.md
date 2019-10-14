Based on how the dockerfile itself is ignored the final output differs or fails to build at all.

```sh
$ docker build --no-cache --file explicitly-ignored.dockerfile .
# output partially truncated
Step 5/5 : RUN tree -a
 ---> Running in 737430195f6d
.
├── README.md
└── glob-one-star-ignore

1 directory, 1 file
```

```sh
$ docker build --no-cache --file ignored-by-glob.ignore.dockerfile .
# output partially truncated
Step 5/5 : RUN tree -a
 ---> Running in 970f0f3ce79a
.
├── README.md
└── glob-one-star-ignore

1 directory, 1 file
```

```sh
$ docker build --no-cache --file explicitly-ignored-dir/explicitly-ignored-dir.dockerfile .
# output partially truncated
Step 5/5 : RUN tree -a
 ---> Running in 9525166f4e4d
.
├── README.md
├── explicitly-ignored-dir
└── glob-one-star-ignore

2 directories, 1 file
```

```sh
$ docker build --no-cache --file glob-one-star-ignore/glob-one-star-ignore.dockerfile .
# output partially truncated
Step 5/5 : RUN tree -a
 ---> Running in e84942db269f
.
├── README.md
└── glob-one-star-ignore

1 directory, 1 file
```

```sh
$ docker build --no-cache --file glob-two-star-ignore/glob-two-star-ignore.dockerfile .
Sending build context to Docker daemon  4.608kB
Error response from daemon: Cannot locate specified Dockerfile: glob-two-star-ignore/glob-two-star-ignore.dockerfile
```