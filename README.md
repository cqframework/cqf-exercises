# CQF Exercises

This repository contains CQL exercises for learning CQL authoring

## Setup

The exercises in this repository can be worked [locally](#local-setup), or [remotely](#remote-setup).

### Remote Setup

The exercises in this repository can be worked using the [codespaces](https://github.com/features/codespaces) feature of Github to allow participants a completely browser-based experience:

1. Make sure you are logged in to Github.com (if you don't have an account, you can signup free [here](https://github.com/signup))
2. Open the repository in a Codespace using the green Code button dropdown (a 4-core machine should be plenty for this)

Note that the first time you open the Codespace will take quite a while, so give it time to initialize.

While the Codespace is initializing, there is an option to open the container in VS Code Desktop. DO NOT SELECT THIS OPTION unless you have VS Code installed locally. Continue to wait for the Codespace to initialize.

Once the Codespace is open, you will be in a VS Code with the contents of this repository open in the File Explorer and can view the exercises in the [input/cql](input/cql) folder.

### Local Setup

These exercises can be worked locally with the [VS Code Plugin](https://github.com/cqframework/vscode-cql). If you do not have Atom and CQL Atom Plugin installed, follow the [Quick Start](https://github.com/cqframework/vscode-cql#quick-start) instructions.

Once you have VSCode installed, the exercises can be downloaded locally (i.e. _cloning_ this repository to your local drive). To do this from within VSCode, follow the instructions for [Cloning a repository](https://code.visualstudio.com/docs/sourcecontrol/github#_cloning-a-repository). When you get to the dialog asking for the repository to clone, provide this link:

```
https://github.com/cqframework/cqf-exercises.git
```

This link is also available from the `Code` button at the top of the repository home page in GitHub.

Once you have cloned the repository locally, open the repository in VSCode at the root of the repository. In the file explorer in the IDE, navigate to the `input/cql` folder and open any of the exercises. Once you're in a CQL editor, you should see syntax highlighting and error reporting, and you can also execute the CQL by right-clicking and selectin `CQL | Execute` from the popup menu, or simply by pressing `F5`.

For more information on the VSCode CQL plugin, refer to the [Using CQL Support in Atom](https://github.com/cqframework/atom_cql_support#using-the-cql-support-in-atom) topic in the Atom CQL Support readme.

## Exercises

The exercises are available in the [input/cql] directory, and linked directly here:

* [Exercises01](input/cql/Exercises01.cql): Preliminaries
* [Exercises02](input/cql/Exercises02.cql): Types and Values
* [Exercises03](input/cql/Exercises03.cql): Operators
* [Exercises04](input/cql/Exercises04.cql): Intervals and Lists
* [Exercises05](input/cql/Exercises05.cql): Terminology
* [Exercises06](input/cql/Exercises06.cql): Data Access
* [Exercises07](input/cql/Exercises07.cql): Queries
* [Exercises08](input/cql/Exercises08.cql): Advanced Queries
* [Exercises09](input/cql/Exercises09.cql): Patterns
* [Exercises10](input/cql/Exercises10.cql): Lung Cancer Screening Decision Support
* [Exercises11](input/cql/Exercises11.cql): Breast Cancer Screening Measure
