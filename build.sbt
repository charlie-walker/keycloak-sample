// Resolvers
lazy val commonResolvers = Seq(
  "clojars"                    at "http://clojars.org/repo/",
  "clojure-releases"           at "http://build.clojure.org/releases",
  "Akka Maven Repository"      at "http://repo.akka.io/releases/",
  "Sonatype Releases"          at "http://oss.sonatype.org/content/repositories/releases",
  "Sonatype Snapshots"         at "http://oss.sonatype.org/content/repositories/snapshots/",
  "Typesafe Repo"              at "http://repo.typesafe.com/typesafe/releases/",
  "ScalaZ Bintray"             at "http://dl.bintray.com/scalaz/releases",
  "Default Maven Repo"         at "https://repo1.maven.org/maven2/"
)

lazy val `sample-keycloak` = (project in file("."))
  .settings(Seq(
    // Scala version
    scalaVersion in ThisBuild := "2.12.10",

    // Scala compiler
    scalacOptions ++= Seq(
      "-unchecked",
      "-Yresolve-term-conflict:package",
      "-Ypartial-unification",
      "-language:higherKinds",
      "-target:jvm-1.8"),
    scalacOptions in Test           ++= Seq("-Yrangepos"),
    scalacOptions in (Compile,doc)  ++= Seq("-groups", "-implicits"),

    // Artifact resolvers and Credentials
    resolvers   ++= commonResolvers,

    // Libraries
    libraryDependencies ++= Seq(

    )
  ))

