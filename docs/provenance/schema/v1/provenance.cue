{
    // Standard attestation fields:
    "_type": "https://in-toto.io/Statement/v1",
    "subject": [...],

    // Predicate:
    "predicateType": "https://slsa.dev/provenance/v1?draft",
    "predicate": {
        "buildDefinition": {
            "buildType": string,
            "externalParameters": object,
            "systemParameters": object,
            "resolvedDependencies": [ ...#ResourceDescriptor ],
        },
        "runDetails": {
            "builder": {
                "id": string,
                "version": string,
                "builderDependencies": [ ...#ResourceDescriptor ],
            },
            "metadata": {
                "invocationId": string,
                "startedOn": #Timestamp,
                "finishedOn": #Timestamp,
            },
            "byproducts": [ ...#ResourceDescriptor ],
        }
    }
}

#ResourceDescriptor: {
    "uri": string,
    "digest": {
        "sha256": string,
        "sha512": string,
        "sha1": string,
        // TODO: list the other standard algorithms
        [string]: string,
    },
    "name": string,
    "downloadLocation": string,
    "mediaType": string,
    "content": string, // base64-encoded bytes
    "annotations": object,
}

#Timestamp: string  // <YYYY>-<MM>-<DD>T<hh>:<mm>:<ss>Z
